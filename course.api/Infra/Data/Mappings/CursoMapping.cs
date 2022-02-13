using course.api.Business.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace course.api.Infra.Data.Mappings
{
    /// <summary>
    /// class CursoMapping 
    /// </summary>
    public class CursoMapping : IEntityTypeConfiguration<Curso>
    {
        /// <summary>
        /// DB configuration
        /// </summary>
        /// <param name="builder"></param>
        public void Configure(EntityTypeBuilder<Curso> builder)
        {
            builder.ToTable("TB_CURSO");
            builder.HasKey(key => key.Codigo);
            builder.Property(p => p.Codigo).ValueGeneratedOnAdd();
            builder.Property(p => p.Nome);
            builder.Property(p => p.Descricao);
            builder.HasOne(p => p.Usuario)
                .WithMany().HasForeignKey(fk => fk.CodigoUsuario);
        }
    }
}
