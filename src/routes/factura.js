import { Router } from 'express';
import factura from '../controllers/facturaController.js';
const router = Router();



router.get('/factura', factura.vista_factura)



export default router;