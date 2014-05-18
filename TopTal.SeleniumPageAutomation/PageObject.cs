using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace TopTal.SeleniumPageAutomation
{
    /// <summary>
    /// Generic Abstract Page Object Pattern with Singleton support
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class PageObject<T> : PageObject
        where T : PageObject, new()
    {
        static T _instance;
        public static T Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new T();
                }
                return _instance;
            }
        }
    }


    /// <summary>
    /// Abstract Page Object pattern
    /// </summary>
    public abstract class PageObject
    {

        protected string Url { get; private set; }
        protected IWebDriver Driver { get; private set; }
        readonly Dictionary<string, Func<string, IWebElement>> _cachedQueries = new Dictionary<string, Func<string, IWebElement>>(StringComparer.InvariantCultureIgnoreCase);
        readonly Dictionary<string, Delegate> _cachedActions = new Dictionary<string, Delegate>(StringComparer.InvariantCultureIgnoreCase);

        public PageObject()
        {
           /// initializing
        }

        private IWebElement FindElementBy(string query, FindBy findBy = FindBy.Name)
        {
            switch (findBy)
            {
                case FindBy.Id:
                    return Driver.FindElement(By.Id(query));
                case FindBy.Name:
                    return Driver.FindElement(By.Name(query));
                case FindBy.XPath:
                    return Driver.FindElement(By.XPath(query));
                case FindBy.Href:
                    return Driver.FindElement(By.XPath(string.Format("//*[@href='{0}']", query)));
                case FindBy.Value:
                    return Driver.FindElement(By.XPath(string.Format("//*[@value='{0}']", query)));
                default:
                    throw new NotSupportedException();
            }
        }

        public virtual void Open()
        {
            Driver.Navigate().GoToUrl(Url);
        }

        public virtual void Close()
        {
            Driver.Close();
        }

        public virtual void Quit()
        {
            Driver.Quit();
        }


        protected virtual bool IsCurrent()
        {
            return true;
        }

        public virtual void Wait(int milliseconds)
        {
            Driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromMilliseconds(milliseconds));
        }


        public virtual IWebElement Find(string name)
        {
            IWebElement elem = null;
            if (_cachedQueries.ContainsKey(name))
            {
                elem = _cachedQueries[name](name);
            }
            return elem;
        }

        public virtual void Click(string name)
        {
            IWebElement elem = Find(name);
            elem.Click();
        }

        public virtual void SendKeys(string name, string value)
        {
            IWebElement elem = Find(name);
            elem.SendKeys(value);
        }

        public virtual void Clean(string name)
        {
            IWebElement elem = Find(name);
            elem.Clear();
        }

        public virtual string GetText(string name)
        {
            IWebElement elem = Find(name);
            return elem.GetAttribute("value");
        }

    }
}
