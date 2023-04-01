import express from 'express'
import { engine } from 'express-handlebars';
import * as dotenv from 'dotenv'
import path from 'path';
import url from 'url';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import index from './routes/index.js';
import empresa from './routes/empresa.js';
import autenticacion from './routes/auntenticacion.js';
import pedido from './routes/pedido.js';
import producto from './routes/producto.js';


//Path
const __filename = url.fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config()
//inicializar 
const app = express();

//Confirguraciones
app.set("port", process.env.PORT || 5000);
app.set("views", path.join(__dirname, "views"));
//Motor de plantillas handlebars
app.engine('.hbs', engine({
    defaultLayout: "main",
    layoutsDir: path.join(app.get("views"), "layouts"),
    partialsDir: path.join(app.get("views"), "partials"),
    extname: ".hbs"
}));
app.set("view engine", ".hbs");

//Midelware
app.use(cookieParser());
app.use(session(
    {
        secret: 'sesion',
        resave: false,
        saveUninitialized: false,
    }
))

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//rutas
app.use(index)
app.use(empresa)
app.use(autenticacion)
app.use(pedido)
app.use(producto)

//public 
app.use(express.static(path.join(__dirname, "public")))

//Ejecutar el servidor
app.listen(app.get("port"), () => {
    console.log(
        "El servidor se inicio en el puerto " +
        "http://localhost:" +
        app.get("port")
    );
});
