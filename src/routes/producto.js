import { Router } from 'express';
import ProductoController from '../controllers/productoController.js';
const router = Router();
var productoController = new ProductoController()

router.post('/consultar-producto-por-empresa', productoController.consultar_producto_por_Empresa);
router.post('/consultar-medidas-por-producto', productoController.consultar_medidas_por_producto);
router.post('/consultar-unica-medida-del-producto', productoController.consultar_unica_medida_del_producto);



export default router;