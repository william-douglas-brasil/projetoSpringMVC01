package br.com.cotiinformatica.reports;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URL;
import java.util.Date;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import br.com.cotiinformatica.entities.Funcionario;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.helpers.DateHelper;

public class FuncionarioReport {

	public ByteArrayInputStream generatePdfReport(Date dataInicio, Date dataFim, List<Funcionario> funcionarios,
			Usuario usuario) throws Exception {

		// criando um objeto que ir� permitir fazermos o retorno do arquivo do relatorio
		// em formato byte (ser� utilizado posteriormente para download do arquivo)
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		// desenhando o documento PDF com a biblioteca iText..
		Document document = new Document();
		PdfWriter writer = PdfWriter.getInstance(document, out);

		// abrir o documento PDF:
		document.open();
		
		Image logo = Image.getInstance(new URL("https://www.cotiinformatica.com.br/imagens/logo-coti-informatica.png"));
		document.add(logo);

		//escrevendo textos no relat�rio..
		document.add(new Paragraph("Relat�rio de Funcion�rios", fmtTitle()));
		
		document.add(new Paragraph("\n"));//quebra de linha
		
		document.add(new Paragraph("Data de gera��o: " + DateHelper.toStringPtBR(new Date()), fmtProfile()));

		document.add(new Paragraph("Per�odo de admiss�o de funcion�rios de: " + DateHelper.toStringPtBR(dataInicio)
				+ " at�: " + DateHelper.toStringPtBR(dataFim), fmtProfile()));

		document.add(new Paragraph("Nome do usu�rio: " + usuario.getNome(), fmtProfile()));
		document.add(new Paragraph("Email: " + usuario.getEmail(), fmtProfile()));
		
		document.add(new Paragraph("\n"));//quebra de linha

		//desenhando uma tabela para exibir os registros de funcion�rios..
		PdfPTable table = new PdfPTable(5); //5 colunas!
		table.setWidthPercentage(100);
		
		//cabe�alho da tabela
		table.addCell(new Paragraph("Nome do Funcion�rio", fmtHeaderCell()));
		table.addCell(new Paragraph("CPF", fmtHeaderCell()));
		table.addCell(new Paragraph("Matr�cula", fmtHeaderCell()));
		table.addCell(new Paragraph("Data de Admiss�o", fmtHeaderCell()));
		table.addCell(new Paragraph("Situa��o", fmtHeaderCell()));
		
		//percorrer os funcionarios e exibir os registros:
		for(Funcionario funcionario : funcionarios) {
			
			table.addCell(new Paragraph(funcionario.getNome(), fmtDataCell()));
			table.addCell(new Paragraph(funcionario.getCpf(), fmtDataCell()));
			table.addCell(new Paragraph(funcionario.getMatricula(), fmtDataCell()));
			table.addCell(new Paragraph(DateHelper.toStringPtBR(funcionario.getDataAdmissao()), fmtDataCell()));
			table.addCell(new Paragraph(funcionario.getSituacao().toString(), fmtDataCell()));
			
		}
		
		//adicionar a tabela no documento pdf..
		document.add(table);
		
		document.close(); //fechando o documento
		writer.close(); //fechando o buffer de mem�ria
		
		// retornando o conteudo do relatorio em bytes
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	private Font fmtTitle() {
		Font font = new Font();
		
		font.setSize(20);
		font.setStyle("bold");
		font.setColor(15, 60, 120);
		
		return font;
	}
	
	private Font fmtProfile() {
		
		Font font = new Font();
		font.setSize(12);
		
		return font;
		
	}
	
	private Font fmtHeaderCell() {
		
		Font font = new Font();
		font.setSize(11);
		font.setStyle("bold");
		
		return font;
	}
	
	private Font fmtDataCell() {
		
		Font font = new Font();
		font.setSize(11);
		
		return font;
	}
}



