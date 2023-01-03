import {config} from 'dotenv'

config()

const PORT = process.env.PORT || "3000"
const DB_HOST =  process.env.host || ""
const DB_USER = process.env.user || ""
const DB = process.env.base || ""
const DB_PASS = process.env.password || ""
const DB_PORT = process.env.dbport || "3306"
const FRONTEND = process.env.front

export {
    PORT,DB_HOST,DB_USER,DB,DB_PASS,DB_PORT,FRONTEND
}
