using System;
using Exercicio17.Objects;
using Microsoft.Data.SqlClient;

namespace Gravadora
{
    class Program
    {
        private static string connectionString = @"Data Source=DESKTOP-S58D4QF;Initial Catalog=Recorder;Integrated Security=True;TrustServerCertificate=True;";

        static void Main(string[] args)
        {
            //Remover os comentários para testar os métodos

            //Criar artista
            //var newArtist = new Artist() { name = "Guilherme", members = 1, rhythm = "Sertanejo" };
            //CreateArtist(newArtist);

            //Ler artista
            //GetArtist(1);

            //Atualizar dados de artista existente
            //var altArtist = new Artist() { artistId = 2, name = "João", members = 5, rhythm = "Rock"};
            //UpdateArtist(altArtist);

            //Remover artista
            //DeleteArtist(1);

            //Criar album
            //var newAlbum = new Album() { name = "Sertanejo vol.1", artistId = 1, rhythm = "Sertanejo"};
            //CreateArtist(newArtist);

            //Ler album
            //GetArtist(1);

            //Atualizar dados de artista existente
            //var altAlbum = new Album() { albumId = 1, name = "Sertanejo vol.1", artistId = 1, rhythm = "Sertanejo" };
            //UpdateArtist(altArtist);

            //Remover Album
            //DeleteAlbum(1);


        }

        public static void CreateArtist(Artist artist)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Artistas (Nome, Qtd_Integrantes, Ritmo) VALUES (@Nome, @Qtd_Integrantes, @Ritmo)";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Nome", artist.name);
                    cmd.Parameters.AddWithValue("@Qtd_Integrantes", artist.members);
                    cmd.Parameters.AddWithValue("@Ritmo", artist.rhythm);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public static void GetArtist(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = $"SELECT * FROM Artistas WHERE Id = {id}";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"Nome: {reader["Nome"]}, Quantidade de Integrantes: {reader["Qtd_Integrantes"]}, Ritmo: {reader["Ritmo"]}");
                    }
                }
                connection.Close();
            }
        }

        public static void UpdateArtist(Artist artist)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE Artistas SET Nome = @Nome, Qtd_Integrantes = @Qtd_Integrantes, Ritmo = @Ritmo WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Id", artist.artistId);
                    cmd.Parameters.AddWithValue("@Nome", artist.name);
                    cmd.Parameters.AddWithValue("@Qtd_Integrantes", artist.members);
                    cmd.Parameters.AddWithValue("@Ritmo", artist.rhythm);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public static void DeleteArtist(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM Artistas WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public static void CreateAlbum(Album album)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Albuns (Nome, Id_artista, Ritmo) VALUES (@Nome, @Id_artista, @Ritmo)";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Nome", album.name);
                    cmd.Parameters.AddWithValue("@Id_artista", album.artistId);
                    cmd.Parameters.AddWithValue("@Ritmo", album.rhythm);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public static void GetAlbum(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = $"SELECT * FROM Albuns WHERE Id = {id}";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"ID: {reader["Id"]}, Nome: {reader["Nome"]}, ArtistaId: {reader["ArtistaId"]}, Ritmo: {reader["Ritmo"]}");
                    }
                }
                connection.Close();
            }
        }

        public static void UpdateAlbum(Album album)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE Albuns SET Nome = @Nome, ArtistaId = @ArtistaId, Ritmo = @Ritmo WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Id", album.albumId);
                    cmd.Parameters.AddWithValue("@Nome", album.name);
                    cmd.Parameters.AddWithValue("@ArtistaId", album.artistId);
                    cmd.Parameters.AddWithValue("@Ritmo", album.rhythm);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public static void DeleteAlbum(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM Albuns WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
        }


    }
}