import { Router } from "express";
import { getCuestionario ,getCuestionarioRespuesta,Transaccion} from "../controllers/cuestionario.controller.js";
import cors from "cors"
const router = Router();

router.get('/cuestionario',getCuestionario)
router.get('/cuestionario/:id',getCuestionarioRespuesta)
router.post('/cuestionario/enviar',Transaccion)

export default router

