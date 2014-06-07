using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TopTalWebTests
{
    [Binding]
    class RegistrationSteps
    {

        [AfterFeature]
        public static void CloseBrowser()
        {
            RegistrationPage.Instance.Quit();
        }

        [Given(@"I open application")]
        public void GivenIOpenApplication()
        {
            RegistrationPage.Instance.Open();
        }

        [Given(@"I press ""(.*)""")]
        public void GivenIPress(string p0)
        {
            RegistrationPage.Instance.Click(p0);
        }

        [When(@"I enter ""(.*)"" into ""(.*)""")]
        public void WhenIEnter(string p0, string p1)
        {
            RegistrationPage.Instance.SendKeys(p1, p0);
        }
        
        //[When(@"I enter (.*)")]
        //public void WhenIEnter(string p0)
        //{
        //    char[] keys = p0.ToString().ToCharArray();
        //    foreach (char c in keys)
        //    {
        //        RegistrationPage.Instance.Click(c.ToString());
        //    }
        //}

        [When(@"I press ""(.*)""")]
        public void WhenIPress(string p0)
        {
            RegistrationPage.Instance.Click(p0);
        }


        [Then(@"there is validation message ""(.*)"" into ""(.*)""")]
        public void ThenThereIsValidation(string p0, string p1)
        {
            string currentValue = RegistrationPage.Instance.GetText(p1);
            Assert.AreEqual(p0, currentValue);
        }

        [Then(@"I press ""(.*)""")]
        public void ThenIPress(string p0)
        {
            RegistrationPage.Instance.Click(p0);
        }


    }
}
