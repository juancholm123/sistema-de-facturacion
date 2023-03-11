const producto = {};
import pool from '../database/conexion.js';

producto.ConsultarTodosLosProductos = async () => {
    const [rows] = await pool.query("select p.id_producto as id,p.fk_empresa, p.producto,p.descripcion, p.estado from producto as p")

    return new Promise((resolve, reject) => {
        if (rows.length > 0) {
            return resolve(rows)
        } else {
            return reject("Fallo la consulta de todas las medidas")
        }
    });

}


export default producto;