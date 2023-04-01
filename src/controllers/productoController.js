
import Producto from '../models/producto.js';
export default class ProductoController {
    constructor() {
        this.producto = new Producto()
    }
    consultar_producto_por_Empresa = (req, res) => {
        const { empresa } = req.body;
        this.producto.ConsultarProductosPorEmpresa(empresa).then((result) => {
            if (result == "Se consulto con exito los productos por empresa") {
                res.status(200).json({
                    status: 200,
                   producto: this.producto.obtener_producto_por_empresa
                })
            }
        }).catch((err) => {
            res.status(404).json({
                msgs: err
            })
            console.log(err);
        });
    }


    consultar_medidas_por_producto = (req, res) => {
        const { empresa, product } = req.body;
        this.producto.ConsultarMedidasDeElproducto(empresa, product).then((result) => {
            if (result == "Se consulto las medidas por producto con exito") {
                res.status(200).json({
                    status: 200,
                    medida: this.producto.obtener_medidadas_por_producto
                })
            }

        }).catch((err) => {
            res.status(404).json({
                msgs: err
            })
            console.log(err);
        });
    }


    consultar_unica_medida_del_producto=(req, res)=> {
        const {empresa,product,medida}= req.body;
        this.producto.ConsultarUnicaMedidaDelProducto(empresa,product,medida).then((result) => {
            if (result == "Se consulto la unica medida del producto con exito") {
                res.status(200).json({
                    status: 200,
                    medida: this.producto.obtener_unica_medidada_del_producto
                })
            }
        }).catch((err) => {
            res.status(404).json({
                msgs: err
            })
            console.log(err);
        });
    }


}


