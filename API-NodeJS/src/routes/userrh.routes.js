import { Router } from "express";
import {getUsersRH, raiz,getUserRH, deleteUserRH, createUserRH,loginUser} from '../controllers/userrh.controller.js'
import cors from "cors"
const router = Router();


router.post('/',raiz)
router.get('/userrh/all',getUsersRH)
router.get('/userrh/search/:id',getUserRH)
router.delete('/userrh/delete/:id',deleteUserRH)
router.post('/userrh/create',createUserRH)
router.post('/userrh/login',loginUser)


export default router