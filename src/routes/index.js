import { Router } from "express";
import IndexController from "../controllers/indexController.js";

const router = Router();
var indexController = new IndexController()

router.get('/', indexController.index)



export default router;