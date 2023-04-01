import { json } from 'express';
import Empresa from '../models/empresa.js';
export default class EmpresaController {
    constructor() {
        this.empresa = new Empresa()
    }

    index_empresa = (req, res) => {
        res.render('./empresa/index')
    }

    prefil = (req, res) => {
        res.render('./empresa/perfil')
    }



    consultar_todas_las_empresas = (req, res) => {
        this.empresa.ConsultarTodasLasEmpresas().then((result) => {
            if (result.length > 0) {
                this.empresa.setTodasLasEmpresas = result
                res.status(200).json({
                    status: 200,
                    empresa: this.empresa.getTodasLasEmpresa
                })
            } else {
                res.status(404).json({
                    msg: 'No se encotro ninguna empresa'
                })
                console.log(err);
            }
        }).catch((err) => {
            res.status(404).json({
                msg: err
            })
            console.log(err);
        });

    }
}

