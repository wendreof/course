using course.api.Business.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace course.api.Infra.Data.Mappings
{
    /// <summary>
    /// Class UsuarioMapping
    /// </summary>
    public class UsuarioMapping : IEntityTypeConfiguration<Usuario>
    {
        /// <summary>
        /// TB_USUARIO configs
        /// </summary>
        public void Configure(EntityTypeBuilder<Usuario> builder)
        {
            builder.ToTable("TB_USUARIO");
            builder.HasKey(key => key.Codigo);
            builder.Property(p => p.Codigo).ValueGeneratedOnAdd();
            builder.Property(p => p.Login);
            builder.Property(p => p.Senha);
            builder.Property(p => p.Email);
        }
    }
}
