package configuracoes;

/**
 *
 * Autor: João Paulo Zinga
 * Data: 02-04-2020
 * Objectivo: Este arquivo possui constantes as configurações do projecto,
 *            como por exemplo os dados para ligação a base de dados.
 * 
 */

public class Config {
    // Driver utilizado
    public static final String DRIVER = "jdbc:postgresql";
    // IP do servidor da base de dados, nesse caso localhost: 127.0.0.1
    public static final String HOST = "localhost";
    // Porta do servidor da Base de dados no caso do Postgres o padrão é 5432
    public static final String PORT = "5432";
    // Nome da base dados
    public static final String DATABASE = "dbLojaVirtual"; 
    // Nome do user na base de dados
    public static final String USER = "postgres";
    // Palavra passe da base de dados
    public static final String PASSWORD = "postgres";
    
    // Caminho da pasta onde constam as imagens inseridas na Base de dados
    public static final String PATH_NAME_IMAGES = "assets/imagens_produtos/";
    
}
