import { Router } from 'express';
import empresa from '../controllers/empresaController.js';
const router = Router();



router.get('/registrar-empresa', empresa.regsitrar_empresa)


export default router;