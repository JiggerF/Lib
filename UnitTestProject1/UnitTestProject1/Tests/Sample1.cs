using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Myob.IdentityServer.AuthorizationServerWebApplication.UITests.Common;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using NUnit.Framework;


namespace UnitTestProject1
{
    [TestFixture]
    public class Sample1
    {

        [SetUp]
        public void Setup()
        {
            Console.WriteLine($"Starting Test....... ");
        }
       

        [Test]
        [Category("Functional")]
        public void VisitFacebook()
        {
            Driver.Init();
            Console.WriteLine($"Starting Method VisitFacebook ....... ");
            Driver.Instance.Navigate().GoToUrl("http://www.facebook.com");
            Driver.Instance.FindElement(By.XPath(".//button[contains(text(),'Create an account')]")).Click();
            Driver.Instance.FindElement(By.Name("firstname")).SendKeys("John");
            Driver.Instance.FindElement(By.Name("lastname")).SendKeys("Alexander");
        }

        [TearDown]
        public void TearDown()
        {
            Driver.Instance.Close();
            Driver.Instance.Quit();
        }
    }
}
