import { Router } from 'express';
import EmpresaController from '../controllers/empresaController.js';
const router = Router();

var empresaController = new EmpresaController()


router.get('/empresa', empresaController.index_empresa)
router.get('/perfil-empresa', empresaController.prefil)
router.get('/consultar-todas-las-empresas', empresaController.consultar_todas_las_empresas);

export default router;