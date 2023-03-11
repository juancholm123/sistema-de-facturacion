import { Router } from "express";
import autenticacionController from "../controllers/autenticacionController.js";


const router = Router();


router.get('/inicio-sesion', autenticacionController.login)
router.get('/registro-usuario', autenticacionController.registro)


export default router;