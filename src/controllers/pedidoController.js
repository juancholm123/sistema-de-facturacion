import empresa from '../models/empresa.js';
import medida from '../models/medida.js';
import producto from '../models/producto.js';

const controller = {}



controller.vista_pedido = (req, res) => {

    res.render('./pedido/pedido');

}

controller.InicializarDatos = (req, res) => {
    empresa.ConsultarTodasLasEmpresas().then((empresa) => {
        if (empresa != undefined && empresa != "" && empresa != null) {

            medida.ConsultarTodasLasMedidas().then((medidas) => {
                if (medida != undefined && medida != "" && medida != null) {
                    producto.ConsultarTodosLosProductos().then((productos) => {
                        if(producto != undefined && producto != "" && producto != null){
                            res.status(200).json({
                                status: 'ok',
                                empresa,
                                medidas,
                                productos
                            })
                        }else{
                            res.status(404).json({
                                mensaje: 'Hubo un error al consultar todos los productos '
                            })
                        }
                     
                    }).catch((err) => {
                        res.status(404).json({
                            mensaje: err
                        })
                    })

                } else {
                    res.status(404).json({
                        mensaje: 'Hubo un error al consultar todas las medidas '
                    })
                }


            }).catch((err) => {
                res.status(404).json({
                    mensaje: err
                })
            })
        } else {
            res.status(404).json({
                mensaje: 'Hubo un error al consultar todas las empresas '
            })
        }


    }).catch((err) => {
        res.status(404).json({
            mensaje: err
        })
    })

}



export default controller