import { Router } from 'express';
import controller from '../controllers/pedidoController.js';
const router = Router();



router.get('/pedido', controller.vista_pedido)
router.post('/inicializar-datos-pedido', controller.InicializarDatos)



export default router;