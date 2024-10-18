using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using demo_frontend.Models;
using Microsoft.Extensions.Configuration;

namespace demo_frontend.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly IConfiguration _configuration;

    // Inject ILogger and IConfiguration
    public HomeController(ILogger<HomeController> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    public IActionResult Index()
    {
        // Fetch environment variables or fallback to appsettings.json
        var welcomeMessage = _configuration["WELCOME_MESSAGE"] ?? _configuration["WelcomeMessage"];
        var footerText = _configuration["FOOTER_TEXT"] ?? _configuration["FooterText"];

        // Pass the values to the view using ViewData
        ViewData["WelcomeMessage"] = welcomeMessage;
        ViewData["FooterText"] = footerText;

        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
