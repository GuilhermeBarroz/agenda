package com.restapi.agenda.Entidade;

import jakarta.persistence.*;

import java.sql.Time;
import java.util.Date;

@Entity
@Table(name = "agendamento")
public class Agendamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ID_Agendamento;

    @Column(nullable = false)
    private Date data;

    @Column(nullable = false)
    private Time hora_inicio;

    @Column(nullable = false)
    private Time hora_fim;

    @Column(nullable = false, length = 250)
    private String nome_usario;

    public Long getID_Agendamento() {
        return ID_Agendamento;
    }

    public void setID_Agendamento(Long ID_Agendamento) {
        this.ID_Agendamento = ID_Agendamento;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Time getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Time hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Time getHora_fim() {
        return hora_fim;
    }

    public void setHora_fim(Time hora_fim) {
        this.hora_fim = hora_fim;
    }

    public String getNome_usario() {
        return nome_usario;
    }

    public void setNome_usario(String nome_usario) {
        this.nome_usario = nome_usario;
    }
}
