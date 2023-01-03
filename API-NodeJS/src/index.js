import  express  from "express";
import {PORT,FRONTEND} from './config.js';
import userrh from './routes/userrh.routes.js';
import cuestionario from './routes/cuestionario.routes.js'
import persona from './routes/persona.routes.js'
import cookieParser from "cookie-parser"
import cors from "cors"



const app = express()

app.set('view engine','ejs')
app.use(cors(FRONTEND))
app.use(express.static('public'))
app.use(express.json())
app.use(express.urlencoded({extended: true}))


app.use('/api',userrh);
app.use('/api',cuestionario);
app.use('/api',persona);
app.listen(PORT);
console.log("Servidor Corriendo en puerto ",PORT);

export default app;