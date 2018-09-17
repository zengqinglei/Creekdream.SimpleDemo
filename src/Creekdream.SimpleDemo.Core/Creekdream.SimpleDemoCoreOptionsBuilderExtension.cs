namespace Creekdream.SimpleDemo
{
    /// <summary>
    /// SimpleDemo core module extension methods for <see cref="AppOptionsBuilder" />.
    /// </summary>
    public static class SimpleDemoCoreOptionsBuilderExtension
    {
        /// <summary>
        /// Add a SimpleDemo core module
        /// </summary>
        public static AppOptionsBuilder AddSimpleDemoCore(this AppOptionsBuilder builder)
        {
            builder.IocRegister.RegisterAssemblyByBasicInterface(typeof(SimpleDemoCoreOptionsBuilderExtension).Assembly);
            return builder;
        }
    }
}


