import { Router } from 'express';
import PedidoController from '../controllers/pedidoController.js';
const router = Router();
var pedidoController = new PedidoController()


router.get('/pedido', pedidoController.vista_pedido);







/* router.post('/producto-por-empresa-por-medida', controller.ConsultarProductoPorEmpresaPorMedida); 
router.post('/mostrar-producto-por-empresa', controller.MostarProductoPorEmpresa);
router.post('/mostrar-medida-por-producto', controller.MostarMedidaPorProducto);
  */




export default router;