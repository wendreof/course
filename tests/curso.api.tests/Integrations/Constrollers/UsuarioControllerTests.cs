﻿using course.api;
using course.api.Models.Usuarios;
using curso.mvc.web.Models.Usuario;
using Microsoft.AspNetCore.Mvc.Testing;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using Xunit.Abstractions;

namespace curso.api.tests.Integrations.Constrollers
{
    public class UsuarioControllerTests : IClassFixture<WebApplicationFactory<Startup>>
    {
        private readonly WebApplicationFactory<Startup> _factory;
        private readonly HttpClient _httpClient;
        private readonly ITestOutputHelper _testOutputHelper;

        public UsuarioControllerTests(WebApplicationFactory<Startup> factory, ITestOutputHelper testOutputHelper)
        {
            _factory = factory;
            _httpClient = _factory.CreateClient();
            _testOutputHelper = testOutputHelper;
        }

        [Fact]
        public void SignupWithNewValidUserShouldReturnOk()
        {
            //Arrange
            var registroViewModelInput = new RegistroViewModelInput
            {
                Login = "wndro",
                Senha = "wndro",
                Email = "wendreo@world.com"
            };

            var content = new StringContent(JsonConvert.SerializeObject(registroViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            var request = _httpClient.PostAsync("api/v1/usuario/registrar", content).GetAwaiter().GetResult();

            //Assert
            Assert.True(request.IsSuccessStatusCode);
        }


        [Fact]
        public async Task LoginWithExistentUserShouldReturnOk()
        {
            //Arrange
            var loginViewModelInput = new LoginViewModelInput
            {
                Login = "wndro",
                Senha = "wndro"
            };

            var content = new StringContent(JsonConvert.SerializeObject(loginViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            var request = await _httpClient.PostAsync("api/v1/usuario/logar", content);

            var loginViewModelOutput = JsonConvert.DeserializeObject<LoginViewModelOutput>(await request.Content.ReadAsStringAsync());

            //Assert
            _testOutputHelper.WriteLine($"Token: {loginViewModelOutput.Token}");
            Assert.NotNull(loginViewModelOutput.Token);
            Assert.True(request.IsSuccessStatusCode);
            Assert.Equal(loginViewModelInput.Login, loginViewModelOutput.Usuario.Login);
        }

        [Fact]
        public async Task LoginWithInvalidUserShouldReturnBadRequest()
        {
            //Arrange
            var loginViewModelInput = new LoginViewModelInput
            {
                Login = "invalid",
                Senha = "invalid"
            };

            var content = new StringContent(JsonConvert.SerializeObject(loginViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            var request = await _httpClient.PostAsync("api/v1/usuario/logar", content);

            //Assert
            Assert.False(request.IsSuccessStatusCode);
        }
    }
}