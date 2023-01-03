import {createPool} from 'mysql2/promise'
import {DB_HOST,DB,DB_USER,DB_PASS, DB_PORT} from '../config.js'

export const pool = createPool({
    host: DB_HOST,
    database:DB,
    user:DB_USER,
    password:DB_PASS,
    ssl:{
        rejectUnauthorized:false
    }
});


/*
export const pool = createPool({
    host: 'us-east.connect.psdb.cloud',
    database:'triada',
    user:'uj6qg3u5zub2h1b601kx',
    password:'pscale_pw_R3DQaFVMiKVZntPGNn7hfKOA9GTyPtxMfV61bRyIEYJ',
    ssl:{
        rejectUnauthorized:false
    }
});*/



pool.getConnection((error,connection)=>{
    if(error) return console.log(new Error('No se pudo conectar a la base de datos'))
    console.log("Base de datos conectada");
    connection.release();
});
