import pool from '../database/conexion.js';
const medida = {}


medida.ConsultarTodasLasMedidas = async () => {
    const [rows] = await pool.query("select m.id_medida as id, m.medida from medida as m")
    return new Promise((resolve, reject) => {
        if (rows.length > 0) {
            return resolve(rows)
        } else {
            return reject("Fallo la consulta de todas las medidas")
        }
    });

}

export default medida;