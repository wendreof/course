using AutoBogus;
using course.api;
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
    public class UsuarioControllerTests : IClassFixture<WebApplicationFactory<Startup>>, IAsyncLifetime
    {
        private readonly WebApplicationFactory<Startup> _factory;
        protected readonly HttpClient _httpClient;
        protected readonly ITestOutputHelper _testOutputHelper;
        protected RegistroViewModelInput RegistroViewModelInput;
        protected LoginViewModelOutput LoginViewModelOutput;

        public UsuarioControllerTests(WebApplicationFactory<Startup> factory, ITestOutputHelper testOutputHelper)
        {
            _factory = factory;
            _httpClient = _factory.CreateClient();
            _testOutputHelper = testOutputHelper;
        }

        [Fact]
        public async Task SignupWithNewValidUserShouldReturnOk()
        {
            //Arrange
            RegistroViewModelInput = new AutoFaker<RegistroViewModelInput>("pt_BR")
                    .RuleFor(modelViewInput => modelViewInput.Login, faker => faker.Person.UserName)
                    .RuleFor(modelViewInput => modelViewInput.Email, faker => faker.Person.Email);

            // RegistroViewModelInput = new RegistroViewModelInput
            //{
            //    Login = "wndro",
            //    Senha = "wndro",
            //    Email = "wendreo@world.com"
            //};

            var content = new StringContent(JsonConvert.SerializeObject(RegistroViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            var request = await _httpClient.PostAsync("api/v1/usuario/registrar", content);

            //Assert
            Assert.True(request.IsSuccessStatusCode);
        }


        [Fact]
        public async Task LoginWithExistentUserShouldReturnOk()
        {
            //Arrange
            var loginViewModelInput = new LoginViewModelInput
            {
                Login = RegistroViewModelInput.Login,
                Senha = RegistroViewModelInput.Senha
            };

            var content = new StringContent(JsonConvert.SerializeObject(loginViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            var request = await _httpClient.PostAsync("api/v1/usuario/logar", content);

            LoginViewModelOutput = JsonConvert.DeserializeObject<LoginViewModelOutput>(await request.Content.ReadAsStringAsync());

            //Assert
            _testOutputHelper.WriteLine($"{nameof(UsuarioControllerTests)}_{nameof(LoginWithExistentUserShouldReturnOk)} = {LoginViewModelOutput.Token}");
            Assert.NotNull(LoginViewModelOutput.Token);
            Assert.True(request.IsSuccessStatusCode);
            Assert.Equal(loginViewModelInput.Login, LoginViewModelOutput.Usuario.Login);
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
            //Assert.False(request.IsSuccessStatusCode);
        }

        public async Task InitializeAsync()
        {
            await SignupWithNewValidUserShouldReturnOk();
            await LoginWithExistentUserShouldReturnOk();
        }

        public async Task DisposeAsync()
        {
            _httpClient.Dispose();
        }
    }
}
