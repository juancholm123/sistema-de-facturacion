
import pool from '../database/conexion.js';

export default class Producto {

    constructor() {
        this._obj_productos_por_empresa = ""
        this._obj_productos_por_empresa_por_medida = ""
        this._obj_meidas_por_producto = ""
        this._obj_unica_meida_del_producto = ""

    }
    ConsultarProductosPorEmpresa = async (empresa) => {
        const [rows] = await pool.query("select p.id_producto, p.descripcion, p.producto from empresa as e inner join producto as p on p.fk_empresa = e.id_empresa where e.empresa = ? ", [empresa]);
        return rows
        /*  return new Promise((resolve, reject) => {
             if (rows.length > 0) {
                 this._obj_productos_por_empresa = rows
                 resolve("Se consulto con exito los productos por empresa")
             } else {
                 reject("No hay datos de los productos por empresa")
             }
         }); */
    }


    ConsultarProductosPorEmpresaPorMedida = async (empresa, producto, medida) => {
        const [rows] = await pool.query("select p.id_producto as id_producto, p.fk_empresa as empresa, p.producto as producto,me_pro.precio,m.medida, p.descripcion as descripcion from empresa as e inner join producto as p on p.fk_empresa = e.id_empresa inner join medida_tiene_producto as me_pro on me_pro.id_producto = p.id_producto inner join medida as m on me_pro.id_medida = m.id_medida where e.empresa = ? and  p.producto= ? and m.medida=? ", [empresa, producto, medida]);
        return new Promise((resolve, reject) => {
            if (rows.length > 0) {
                this._obj_productos_por_empresa_por_medida = rows
                resolve("Se consulto los productos por empresa por medida con exito")
            } else {
                reject("No hay datos de los productos por empresa por medida")
            }
        });
    }

    ConsultarMedidasDeElproducto = async (empresa, producto) => {
        const [rows] = await pool.query("select m.medida,me_pro.precio as precio,me_pro.cantidad as cantidad from empresa as e inner join producto as p on p.fk_empresa = e.id_empresa inner join medida_tiene_producto as me_pro on me_pro.id_producto = p.id_producto inner join medida as m on me_pro.id_medida = m.id_medida where e.empresa = ? and  p.producto= ?", [empresa, producto]);
        return new Promise((resolve, reject) => {
            if (rows.length > 0) {
                this._obj_meidas_por_producto = rows
                resolve("Se consulto las medidas por producto con exito")
            } else {
                reject("los datos estan vacios, no hay medidadas por producto")
            }
        });
    }

    ConsultarUnicaMedidaDelProducto = async (empresa, producto, medida) => {
        const [rows] = await pool.query("select m.medida,me_pro.precio as precio,me_pro.cantidad as cantidad from empresa as e inner join producto as p on p.fk_empresa = e.id_empresa inner join medida_tiene_producto as me_pro on me_pro.id_producto = p.id_producto inner join medida as m on me_pro.id_medida = m.id_medida where e.empresa = ? and  p.producto= ? and m.medida=? ", [empresa, producto, medida]);
        return new Promise((resolve, reject) => {
            if (rows.length > 0) {
                this._obj_unica_meida_del_producto = rows
                resolve("Se consulto la unica medida del producto con exito")
            } else {
                reject("los datos estan vacios, no hay una unica medida del producto")
            }
        });
    }


    get obtener_producto_por_empresa() {
        return this._obj_productos_por_empresa
    }

    get obtener_producto_por_empresa_por_medida() {
        return this._obj_productos_por_empresa_por_medida
    }

    get obtener_medidadas_por_producto() {
        return this._obj_meidas_por_producto
    }

    get obtener_unica_medidada_del_producto() {
        return this._obj_unica_meida_del_producto
    }

}

