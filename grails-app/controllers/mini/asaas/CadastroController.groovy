package mini.asaas

class CadastroController {

    def index() { }

    def salvarCadastro() {
        def nome = params.nome;
        def cpf = params.cpf;
        def telefone = params.telefone;
        def cep = params.cep;
        def logradouro = params.logradouro;
        def numero = params.numero;
        def bairro = params.bairro;
        def cidade = params.cidade;
        def estado = params.estado;

        println "Nome: $nome";
        println "CPF: $cpf";
        println "Telefone: $telefone";
        println "CEP: $cep";
        println "Logradouro: $logradouro";
        println "Número: $numero";
        println "Bairro: $bairro";
        println "Cidade: $cidade";
        println "Estado: $estado";
        println "Cadastro Realizado com Sucesso!";
        
        redirect(action: "index");
    }
}
