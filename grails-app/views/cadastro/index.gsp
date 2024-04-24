<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Página de cadastro</title>
    <style>
        body {
            background-color:black;
        }
        @media only screen and (min-width:600px){
            .caixa {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border: 4px solid #22D4FD;
                border-radius: 5px;
                width: 100%;
                margin: auto;
                padding: 20px;
            }
            .bemvindo {
                color: #F6F6F6;
                flex: 1;
                padding: 20px;
            }
            .form {
                flex: 2;
                text-align: center;
            }
            .formulario {
                width: 400px; 
                margin:auto;
            }
            input {
                width: 400px;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border-radius: 5px;
            }
            label {
                color:#F6F6F6;
                margin-bottom:5px;
            }
            button {
                width: 180px;
                padding: 10px;
                margin-top: 10px;
                border-radius: 5px;
                background-color: #22D4FD;
                font-family: courier;
                font-weight: bold;
            }
            h1 {
                font-size: 250%;
                font-family: courier;
            }
            p {
                font-size: 150%;
                font-family: verdana;
            }
            strong {
                color: #22D4FD;
            }
        }
        @media only screen and (max-width:600px){
            .caixa {
                display: flex;
                flex-direction: column;
                border: 4px solid #22D4FD;
                border-radius: 5px;
                width:100%;
                margin: auto;
                padding: 20px;
            }
            .bemvindo {
                width: 100%;
                text-align: center;
                margin-bottom: 20px;
                color: #F6F6F6;
            }
            .form {
                width: 100%;
                text-align: center;
                margin-bottom: 20px;
            }
            .formulario {
                width: 100%;
                margin: auto;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border-radius: 5px;
            }
            button {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border-radius: 5px;
                background-color: #22D4FD;
                font-family: courier;
                font-weight: bold;
            }
            h1 {
                font-size: 250%;
                font-family: courier;
            }
            p {
                font-size: 150%;
                font-family: verdana;
            }
            strong {
                color: #22D4FD;
            }
            label {
                color:#F6F6F6;
                margin-bottom:5px;
            }
        }
    </style>
    <script>
        function my_callback(conteudo){
            if (!("erro" in conteudo)){
                document.getElementById('logradouro').value = (conteudo.logradouro);
                document.getElementById('bairro').value = (conteudo.bairro);
                document.getElementById('cidade').value = (conteudo.localidade);
                document.getElementById('estado').value = (conteudo.uf);
            } else {
                alert("CEP não encontrado.");
            }
        }
        function pesquisacep(valor){
            var cep = valor.replace(/\D/g, '');

            if(cep != "") {
                var validacep = /^[0-9]{8}$/;

                if(validacep.test(cep)) {
                    document.getElementById('logradouro').value="...";
                    document.getElementById('bairro').value="...";
                    document.getElementById('cidade').value="...";
                    document.getElementById('estado').value="...";

                    var script = document.createElement('script');

                    script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=my_callback';

                    document.body.appendChild(script);
                } else {
                    alert("Formato de CEP inválido.");
                }
            } else {
                // cep sem valor
            }
        };

        function limpar_conteudo(){
            document.getElementById('nome').value = ("");
            document.getElementById('cpf').value = ("");
            document.getElementById('telefone').value = ("");
            document.getElementById('cep').value = ("");
            document.getElementById('logradouro').value = ("");
            document.getElementById('numero').value = ("");
            document.getElementById('bairro').value = ("");
            document.getElementById('cidade').value = ("");
            document.getElementById('estado').value = ("");
            console.clear();
        }
    </script>
</head>
<body>
    <div class="caixa">
        <div class="bemvindo">
            <h1>Bem-vindo a página de <strong>cadastro!</strong></h1><br>
            <p>Use o formulário para <strong>preenchimento de seus dados</strong>.</p>
        </div>
        <div class="form">
            <form class="formulario" method="post" action="${createLink(controller: 'cadastro', action:'salvarCadastro')}">
                <label for="nome">NOME:</label>
                <input type="text" id="nome" name="nome" placeholder="Nome"><br>
                <label for="nome">CPF:</label>
                <input type="text" id="cpf" name="cpf" placeholder="00000000000" size="12" maxlength="11"><br>
                <label for="nome">TELEFONE:</label>
                <input type="text" id="telefone" name="telefone" placeholder="(12) 91234-5678"><br>
                <label for="nome">CEP:</label>
                <input type="text" id="cep" name="cep" placeholder="CEP" size="10" maxlength="9" onblur="pesquisacep(this.value);"><br>
                <label for="nome">LOGRADOURO/RUA:</label>
                <input type="text" id="logradouro" name="logradouro" placeholder="Logradouro"><br>
                <label for="nome">NUMERO:</label>
                <input type="text" id="numero" name="numero" placeholder="Número"><br>
                <label for="nome">BAIRRO:</label>
                <input type="text" id="bairro" name="bairro" placeholder="Bairro"><br>
                <label for="nome">CIDADE:</label>
                <input type="text" id="cidade" name="cidade" placeholder="Cidade"><br>
                <label for="nome">ESTADO:</label>
                <input type="text" id="estado" name="estado" placeholder="Estado"><br>
                <button id="limpar" type="button" onclick="limpar_conteudo()">LIMPAR</button>
                <button id="enviar" type="submit">ENVIAR</button>
            </form>
        </div>
    </div>
</body>
</html>
