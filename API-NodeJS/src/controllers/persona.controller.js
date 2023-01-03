import { pool } from '../database/database.js'

export const getPersonas = async (req,res) => {
    const [rows] =  await pool.query('SELECT * FROM persona')
    res.json(rows)
}

export const getPersona = async (req,res)=>{
    const {id} = req.params
    const [rows] = await pool.query('SELECT * FROM persona WHERE ID=?',id)
    if(rows.length <= 0) return res.status(404).json({
        message:'Usuario persona no encontrado'
    })
    res.json(rows[0])
}
export const getPersonasRH = async (req,res)=>{
    const {id} = req.params
    const [rows] = await pool.query('SELECT A.* FROM persona A JOIN rh_persona B ON B.ID_Persona = A.ID AND B.ID_RH = ?',id)
    if(rows.length <= 0) return res.status(404).json({
        message:'Usuarios persona no encontrado'
    })
    res.json(rows)
}

export const deletePersona = async (req,res) => {
    const {id} = req.params
    const [result] = await pool.query('DELETE FROM persona WHERE ID=?',id)
    if(result.affectedRows <= 0) return res.status(404).json({
        message:'Usuario persona no encontrado'
    })
    res.send('Usuario persona eliminado')
}

export const createPersona = async (req,res) => {
    const {Nombre,ApP,ApM,Fecha_nac,Correo} = req.body
    const [rows] = await pool.query('INSERT INTO persona (Nombre,A_Paterno,A_Materno,Fecha_nac,Correo) VALUES (?,?,?,?,?)',[Nombre,ApP,ApM,Fecha_nac,Correo])
    res.json({
        message:"Usuario persona creado",
        id: rows.insertId,
        Nombre: Nombre,
        Correo: Correo
    })
}

export const deleteRHPersona = async (req,res) => {
    const {ID_RH , ID} = req.params
    const [result] = await pool.query('DELETE FROM rh_persona WHERE ID_RH=? and ID_Persona=?',[ID_RH,ID])
    if(result.affectedRows <= 0) return res.status(404).json({
        message:'Relacion no encontrada'
    })
    res.send('Usuario persona retirado del dashboard RH')
}