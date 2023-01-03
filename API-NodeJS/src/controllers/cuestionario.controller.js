import { pool } from '../database/database.js'

export const getCuestionario = async (req,res) => {
    const [rows] =  await pool.query('SELECT * FROM preguntas')
    res.json(rows)
}

export const getCuestionarioRespuesta = async (req,res) => {
    const {id} = req.params
    const [rows] =  await pool.query('SELECT ID_Pregunta FROM cuestionario WHERE ID_persona=? and ID_Opcion = 2',id)
    res.json(rows)
}

export const Transaccion = async (req,res) =>{
    const {Candidato,Preguntas} = req.body
    let id;
    let conn=null;
    try{
        conn = await pool.getConnection();
        await conn.beginTransaction();
        const idCandidato = await conn.query('SELECT ID FROM persona WHERE Correo=?',Candidato.Correo)
        if(idCandidato[0].length <=0){
            const [rows] = await conn.query('INSERT INTO persona(Nombre,A_Paterno,A_Materno,Fecha_nac,Correo,Genero) VALUES (?,?,?,?,?,?)',[Candidato.Nombre,Candidato.A_Paterno,Candidato.A_Materno,Candidato.Fecha_nac,Candidato.Correo,Candidato.Genero])
            id = rows.insertId
        }else{
            id=idCandidato[0][0].ID
        }
        const idRelacion = await conn.query('SELECT ID FROM rh_persona WHERE ID_RH=? AND ID_Persona = ?',[Candidato.Codigo,id])
        if(idRelacion[0].length <=0){
            await conn.query('INSERT INTO rh_persona(ID_RH,ID_Persona) VALUES (?,?)',[Candidato.Codigo,id])
        }
        for(let i=0;i<Preguntas.length;i++){
            const ID_opc = await conn.query('SELECT ID FROM opciones WHERE Respuesta=?',Preguntas[i])
            const bandera = await conn.query('SELECT ID  FROM cuestionario WHERE ID_Persona = ? AND ID_Pregunta = ?',[id,i+1])
            if(bandera[0].length > 0 ){
                await conn.query('UPDATE cuestionario SET ID_opcion = ? WHERE ID = ?',[ID_opc[0][0].ID,bandera[0][0].ID])
            }else{
                await conn.query('INSERT INTO cuestionario(ID_Pregunta,ID_Opcion,ID_Persona) VALUES (?,?,?)',[i+1,ID_opc[0][0].ID,id])
            }
            //await conn.query('CALL llenarCuestionario(?,?,?)',[Preguntas[i],id,i+1]);
        }
        await conn.commit();
        res.json({
            message:"Usuario persona creado",
        })
    }catch(e){
        if (conn) await conn.rollback();
        throw e;
    }finally{
        if (conn) await conn.release();
    }
}