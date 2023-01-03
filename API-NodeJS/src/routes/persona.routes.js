import { Router } from "express";
import {getPersona,getPersonas, deletePersona, createPersona, getPersonasRH, deleteRHPersona} from '../controllers/persona.controller.js'
import cors from "cors"
const router = Router();

router.get('/persona/all',getPersonas)
router.get('/persona/search/:id',getPersona)
router.get('/persona/searchrh/:id',getPersonasRH)
router.delete('/persona/delete/:id',deletePersona)
router.delete('/persona/deleteRH/:ID_RH/:ID',deleteRHPersona)
router.post('/persona/create',createPersona)


export default router