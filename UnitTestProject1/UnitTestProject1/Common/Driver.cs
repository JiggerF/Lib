using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Remote;

namespace Myob.IdentityServer.AuthorizationServerWebApplication.UITests.Common
{
    public class Driver
    {
        public static IWebDriver Instance;
        protected static readonly ImageFormat ScreenshotImageFormat = ImageFormat.Png;


        public Driver()
        {

        }

        public static void Init()
        {
            try
            {
                Instance = new ChromeDriver();
                Instance.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(10));
                Instance.Manage().Window.Maximize();
                Console.WriteLine("WebDriver initialized...");
            }
            catch (WebDriverException e)
            {
                Console.WriteLine("Error initializing webdriver!");
                Console.WriteLine(e.Message);
            }
        }

        public static void Close()
        {
            Driver.Instance.Close();
            Driver.Instance.Quit();

            Console.WriteLine("Closing webdriver instance...");
        }

        public static void TakeScreenShot()
        {
            var testName = TestContext.CurrentContext.Test.Name;
            string timestamp = DateTime.Now.ToString("yyyy-MM-dd-hhmm-ss");

            Screenshot ss = ((ITakesScreenshot)Driver.Instance).GetScreenshot();
            var base64 = ss.AsBase64EncodedString;
            ss.SaveAsFile(testName + "_" + timestamp + ".png", ScreenshotImageFormat);
        }
    }
}
