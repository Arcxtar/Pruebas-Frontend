import { pool } from '../database/database.js'
import jwt from 'jsonwebtoken'
import bcryptjs from 'bcryptjs'

export const getUsersRH = async (req,res) => {
    const [rows] =  await pool.query('SELECT * FROM usuario_rh')
    res.json(rows)
}

export const getUserRH = async (req,res)=>{
    const {id} = req.params
    const [rows] = await pool.query('SELECT * FROM usuario_rh WHERE ID=?',id)
    if(rows.length <= 0) return res.status(404).json({
        message:'Usuario RH no encontrado'
    })
    res.json(rows[0])
}

export const getUserRHCorreo = async (req,res)=>{
    const {Correo} = req.body
    const [rows] = await pool.query('SELECT * FROM usuario_rh WHERE Correo=?',Correo)
    if(rows.length <= 0) return res.status(404).json({
        message:'Usuario RH no encontrado'
    })
    res.json(rows[0])
}

export const deleteUserRH = async (req,res) => {
    const {id} = req.params
    const [result] = await pool.query('DELETE FROM usuario_rh WHERE ID=?',id)
    if(result.affectedRows <= 0) return res.status(404).json({
        message:'Usuario RH no encontrado'
    })
    res.send('Usuario RH eliminado')
}

export const createUserRH = async (req,res) => {
    const {Nombre,A_Paterno,A_Materno,Empresa,Fecha_nac,Correo,Contrasena,Genero} = req.body

    const [id] = await pool.query('SELECT ID FROM usuario_rh WHERE Correo = ?',Correo);
    if(id.length > 0) return res.status(404).json({
        message:'Usuario Existente'
    })
    let passHas = await bcryptjs.hash(Contrasena,8)
    const [rows] = await pool.query('INSERT INTO usuario_rh(Nombre,A_Paterno,A_Materno,Empresa,Fecha_nac,Correo,Contrasena,Genero) VALUES (?,?,?,?,?,?,?,?)',[Nombre,A_Paterno,A_Materno,Empresa,Fecha_nac,Correo,passHas,Genero])
    if(rows.affectedRows == undefined){
        res.json({
            Mensaje:"Usuario existente",
            Estado:false
        })
    }else{
        res.json({
            Mensaje:"Usuario registrado",
            Estado:true
        })
    }
}

export const raiz = async (req,res,next) =>{
    console.log(req.body)
    res.json({
        message:"Entramos al backend"
    })
}



export const loginUser = async (req, res) => {
    const { Correo, Contrasena } = req.body;
    // Validamos si el usuario existe en la base de datos
    //const user = await User.findOne({ where: { Correo: Correo } });
    const [rows] = await pool.query('SELECT ID,Contrasena FROM usuario_rh WHERE Correo=?',Correo)
    //console.log("Longitud:"+rows.length) --> Longitud de la consulta
    //console.log("Contenido:\nContrase:"+rows[0].Contrasena+"\nID:"+rows[0].ID); //--> Contenido de contraseña

    if(rows.length <= 0) return res.status(404).json({
        Mensaje: `No existe un usuario con el nombre ${Correo} en la base datos`,
        Estado:false
    })
    // Validamos password
    const passwordValid = await bcryptjs.compare(Contrasena, rows[0].Contrasena)
    if(!passwordValid) {
        return res.json({
            Mensaje: `Password Incorrecta`,
            Estado:false
        })
    }
    // Generamos token
    const token = jwt.sign({
        Correo: Correo
    }, process.env.SECRET_KEY || 'Admin123');
    // console.log(token) --> Banderas del token
    res.json({
        Token:token,
        ID:rows[0].ID
    });
}