const p = document.getElementById('pedido');
const pedido = {}

if (p != null && p != undefined && p != "") {
    const SelectEmpresa = document.getElementById('select-empresa');
    const SelectMedida = document.getElementById('select-medida');
    const SelectProducto = document.getElementById('select-producto');

    pedido.inicializar_datos = () => {
        fetch("/inicializar-datos-pedido", {
            method: "POST",
        }).then(res => res.json()).then(res => {
            if (res.status == 'ok') {
                console.log(res);
                LlenarSelect(SelectEmpresa, res.empresa,"empresa");
                LlenarSelect(SelectMedida, res.medidas,"medida");
                 LlenarSelect(SelectProducto, res.productos,"producto"); 
            }
        })
    }


    const LlenarSelect = (select, dato,elemento) => {
        dato.forEach(element => {
            const option = document.createElement('option');
            option.text = element[`${elemento}`];
            select.appendChild(option);
        });
    }
}





export default pedido;
