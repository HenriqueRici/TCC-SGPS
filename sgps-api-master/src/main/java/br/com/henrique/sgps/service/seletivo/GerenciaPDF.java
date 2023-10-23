package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.dtos.seletivo.ResultadoByEdital;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

import java.util.List;

@Service
@AllArgsConstructor
public class GerenciaPDF {

    private final GeraResultadoByIdSeletivo geraResultadoByIdSeletivo;

    private final FindProcessoSeletivoById findProcessoSeletivoById;

    private final ProcessoSeletivoRepository processoSeletivoRepository;
    public void geraPdf( Integer idSeletivo){
        ProcessoSeletivo processoSeletivo = this.findProcessoSeletivoById.execute(idSeletivo);
        Document document = new Document(PageSize.A4);
        document.setMargins(20, 20, 20, 20);

        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

            PdfWriter.getInstance(document,byteArrayOutputStream);



            document.open();
            PdfPTable table = new PdfPTable(4);

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);

            Paragraph titulo = new Paragraph("Resultado do Edital " + processoSeletivo.getEdital(), titleFont);

      ;
            titulo.setAlignment(Element.ALIGN_CENTER);
            Paragraph pularLinha = new Paragraph("\n");

            document.add(titulo);
            document.add(pularLinha);

            // Adição de células à tabela
            Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

            PdfPCell cell1 = new PdfPCell(new Phrase("Nome", boldFont));

            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);


            PdfPCell cell2 = new PdfPCell(new Paragraph("CPF", boldFont));

            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);


            PdfPCell cell3 = new PdfPCell(new Paragraph("Pontuação", boldFont));

            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);



            PdfPCell cell4 = new PdfPCell(new Paragraph("Classificação", boldFont));

            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);


            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);


            List<ResultadoByEdital> listResultado = geraResultadoByIdSeletivo.execute(idSeletivo);

            for (int i = 0; i < listResultado.size(); i++) {
                ResultadoByEdital resultadoByEdital = listResultado.get(i);
                table.addCell(resultadoByEdital.getNome());
                table.addCell(resultadoByEdital.getCpf());
                table.addCell(String.valueOf(resultadoByEdital.getPontuacao()));
                table.addCell(String.valueOf(i +1));
            }
            document.add(table);
            document.close();

            byte[] pdfBytes = byteArrayOutputStream.toByteArray();
            processoSeletivo.setResultado(pdfBytes);
            processoSeletivoRepository.save(processoSeletivo);

        } catch (DocumentException  e) {
            throw new RuntimeException(e);
        }

    }
}
