import { Router } from 'express';
import empresa from '../controllers/empresaController.js';
const router = Router();



router.get('/empresa', empresa.index_empresa)


export default router;