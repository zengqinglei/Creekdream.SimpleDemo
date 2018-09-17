namespace Creekdream.SimpleDemo
{
    /// <summary>
    /// SimpleDemo application module extension methods for <see cref="AppOptionsBuilder" />.
    /// </summary>
    public static class SimpleDemoApplicationOptionsBuilder
    {
        /// <summary>
        /// Add an SimpleDemoApplication module
        /// </summary>
        public static AppOptionsBuilder AddSimpleDemoApplication(this AppOptionsBuilder builder)
        {
            builder.IocRegister.RegisterAssemblyByBasicInterface(typeof(SimpleDemoApplicationOptionsBuilder).Assembly);
            return builder;
        }
    }
}


