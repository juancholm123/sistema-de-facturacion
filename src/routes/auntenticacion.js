import { Router } from "express";
import Autenticacioncontroller from "../controllers/autenticacionController.js";

var autenticacionController = new Autenticacioncontroller()
const router = Router();


router.get('/inicio-sesion', autenticacionController.login)
router.get('/registro-usuario', autenticacionController.registro)


export default router;