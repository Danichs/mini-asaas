<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Página de cadastro</title>
    <style>
        body {
            background-color:black;
        }
        .caixa {
            display:flex;
            border:4px solid #22D4FD;
            border-radius: 5px;
            width:100%;
            height:100%;
        }
        .bemvindo {
            color:#F6F6F6;
            padding:10px;
            margin:100px;
            margin-top:300px;
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
        .form {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align:center;
            padding:10px;
        }
        label {
            color:#F6F6F6;
            margin-bottom:5px;
        }
        form {
            display: flex;
            flex-direction: column;
            width: 300px;
        }
        input {
            padding: 5px;
            width: 100%;
            box-sizing: border-box;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="caixa">
        <div class="bemvindo">
            <h1>Bem-vindo a página de <strong>cadastro!</strong></h1><br>
            <p>Use o formulário a direita para <strong>preenchimento de seus dados</strong>.</p>
        </div>
        <div class="form">
            <form>
                <label for="nome">NOME:</label>
                <input type="text" id="nome" name="nome"><br>
                <label for="nome">CPF:</label>
                <input type="text" id="cpf" name="cpf"><br>
                <label for="nome">TELEFONE:</label>
                <input type="text" id="telefone" name="telefone"><br>
                <label for="nome">CEP:</label>
                <input type="text" id="cep" name="cep"><br>
                <label for="nome">ENDERECO:</label>
                <input type="text" id="endereco" name="endereco"><br>
                <label for="nome">BAIRRO:</label>
                <input type="text" id="bairro" name="bairro"><br>
                <label for="nome">CIDADE:</label>
                <input type="text" id="cidade" name="cidade"><br>
                <label for="nome">ESTADO:</label>
                <input type="text" id="estado" name="estado"><br>
            </form>
        </div>
    </div>
    <script>
        document.getElementById("cep").addEventListener("input", function(){
            var cep = this.value.replace(/\D/g, '');
            if(cep.length === 8){
                fetch(`https://viacep.com.br/ws/${cep}/json/`)
                .then(response => response.json())
                .then(data => {
                    if(data.erro){
                        console.error("CEP não encontrado");
                    } else {
                        // OBS CONTINUAR A FAZER O SCRIPT AMANHA
                    }
                })
            }
        })
    </script>
</body>
</html>
