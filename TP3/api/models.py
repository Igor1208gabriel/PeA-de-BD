from django.db import models

class Paciente(models.Model):
    nome = models.CharField(max_length=100)
    endereco = models.CharField(max_length=100)
    redes_sociais = models.TextField(blank=True)
    indicado_por = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True, related_name='referenciados')
    parentes = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True,choices=[('pai', 'Pai'), ('mae', 'Mãe'), ('irma', 'Irmã'), ('filho', 'Filho'), ('avo', 'Avô/Avó')], related_name='parente')

    def total_recebido(self):
        consulta = Consulta.objects.filter(paciente=self, status='Pago')
        valor = 0
        for i in consulta:
             valor += i.valor
        return valor


    def total_consultas(self):
        consultas = Consulta.objects.filter(paciente=self)
        total = consultas.count()
        return total

    def __str__(self):
        consultas = self.total_consultas()
        recebido = self.total_recebido()
        return f'Paciente {self.nome} com id {self.id} e {consultas} consultas resultando em {recebido}R$'



class Consulta(models.Model):
    class Status(models.TextChoices):
        EM_ABERTO = 'Em aberto'
        PAGO = 'Pago'
        CANCELADO = 'Cancelado'

    status = models.CharField(
        max_length=10, 
        choices=Status.choices, 
        default=Status.EM_ABERTO
    )

    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE, related_name='consultas')
    data = models.DateField(blank=True)
    valor = models.FloatField()
    descricao = models.TextField()
    def __str__(self):
        return f'Consulta para {self.paciente} em {self.data}'
