import { createPool } from 'mysql2/promise';
import * as dotenv from 'dotenv';

dotenv.config();
const pool = createPool({
    host: process.env.HOST,
    user:process.env.USUARIO,
    database: process.env.DATABASE
})

export default pool;