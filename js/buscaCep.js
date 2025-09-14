// função que faz uma busca do cep q a pessoa digitou a uma API chamada "ViaCEP", para preencher automaticamente os campos de endereço, cidade e tals quando a pessoa digitar apenas o cep
function buscaCep(cep){

    const input_endereco = document.getElementById('input_endereco');
    const input_bairro = document.getElementById('input_bairro');
    const input_cidade = document.getElementById('input_cidade');
    const input_estado = document.getElementById('input_estado');

    // pega os dados da api, usando o cep que a pessoa digitou
    fetch(`https://viacep.com.br/ws/${cep}/json/`)


    .then (response =>{
        // se a resposta nao for ok, da erro
        if(!response.ok){
            console.log("Erro de conexão com a API do viacep");
        }

        return response.json();
    })

    .then(data =>{
        console.log(data);

        // insere os dados fetichados (lá ele) nos campos de input
        input_endereco.value = data.logradouro;
        input_bairro.value = data.bairro;
        input_cidade.value = data.localidade;
        input_estado.value = data.uf;
    })


    // se por algum motivo dar erro, consolar ele no log
    .catch(error =>{
        console.log(`Erro: ${error}`);
    });
}