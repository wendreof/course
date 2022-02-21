using AutoBogus;
using course.api;
using course.api.Models;
using Microsoft.AspNetCore.Mvc.Testing;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using Xunit.Abstractions;

namespace curso.api.tests.Integrations.Constrollers
{
    public class CursoControllerTests : UsuarioControllerTests
    {

        public CursoControllerTests(WebApplicationFactory<Startup> factory, ITestOutputHelper testOutputHelper) : base(factory, testOutputHelper)
        {

        }

        [Fact]
        public async Task RegisterNewCourseWithValidDataShouldReturnOk()
        {
            //Arrange
            var cursoViewModelInput = new AutoFaker<CursoViewModelInput>("pt_BR")
                    .RuleFor(modelViewInput => modelViewInput.Nome, faker => faker.Person.Email);

            var content = new StringContent(JsonConvert.SerializeObject(cursoViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", LoginViewModelOutput.Token);
            var request = await _httpClient.PostAsync("api/v1/cursos", content);

            //Assert
            Assert.True(request.IsSuccessStatusCode);
        }

        [Fact]
        public async Task GetCoursesFromOkUserShouldReturnOk()
        {
            //Arrange
            await RegisterNewCourseWithValidDataShouldReturnOk();

            //Act
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", LoginViewModelOutput.Token);
            var request = await _httpClient.GetAsync("api/v1/cursos");

            //Assert
            //var cursos = JsonConvert.DeserializeObject<IList<CursoViewModelOutput>>(await request.Content.ReadAsStringAsync());
            //_testOutputHelper.WriteLine($"return get cursos: {cursos}");

            Assert.True(request.IsSuccessStatusCode);
        }

        [Fact]
        public async Task GetCoursesFromWithoutTokenUserShouldReturnOk()
        {
            //Arrange
            await RegisterNewCourseWithValidDataShouldReturnOk();

            //Act
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "LoginViewModelOutput.Token");
            var request = await _httpClient.GetAsync("api/v1/cursos");

            //Assert
            //var cursos = JsonConvert.DeserializeObject<IList<CursoViewModelOutput>>(await request.Content.ReadAsStringAsync());
            //_testOutputHelper.WriteLine($"return get cursos: {cursos}");

            Assert.False(request.IsSuccessStatusCode);
        }

        [Fact]
        public async Task RegisterNewCourseWithoutTokenShouldReturnBadRequest()
        {
            //Arrange
            var cursoViewModelInput = new AutoFaker<CursoViewModelInput>()
                    .RuleFor(modelViewInput => modelViewInput.Nome, faker => faker.Person.Email);

            var content = new StringContent(JsonConvert.SerializeObject(cursoViewModelInput), encoding: Encoding.UTF8, mediaType: "application/json");

            //Act
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "Invalid Token");
            var request = await _httpClient.PostAsync("api/v1/cursos", content);

            //Assert
            Assert.False(request.IsSuccessStatusCode);
        }
    }
}
