<!DOCTYPE html>
<html>
    <body>
        <table>
            <tr>
                <th colspan="3" style="border-bottom: 2px solid #6678b1;color: #039;font-size: 14px;font-weight: normal;padding: 10px 8px;">
                    <?php echo $this->translate->t("Запитване относно") ?>
                </th>
            </tr>
            <tr>
                <td style="color: #669;padding: 9px 8px 0;"><?php echo (($query->get_product()) ? ($query->get_product()->code."(" . $query->get_product()->title . ")") : $this->translate->t("Общо")); ?></td>
            </tr>
            <tr>
                <th style="border-bottom: 2px solid #6678b1;color: #039;font-size: 14px;font-weight: normal;padding: 10px 8px;">
                    <?php echo $this->translate->t("Име на клиента") ?>
                </th>
                <th style="border-bottom: 2px solid #6678b1;color: #039;font-size: 14px;font-weight: normal;padding: 10px 8px;">
                    <?php echo $this->translate->t("Имейл на клиента") ?>
                </th>
                <th style="border-bottom: 2px solid #6678b1;color: #039;font-size: 14px;font-weight: normal;padding: 10px 8px;">
                    <?php echo $this->translate->t("Телефон на клиента") ?>
                </th>

            </tr>
            <tr>
                <td style="color: #669;padding: 9px 8px 0;"><?php echo $this->input->post("name"); ?></td>
                <td style="color: #669;padding: 9px 8px 0;"><?php echo $this->input->post("email"); ?></td>
                <td style="color: #669;padding: 9px 8px 0;"><?php echo $this->input->post("phone"); ?></td>
            </tr>
            <tr>
                <th colspan="3" style="border-bottom: 2px solid #6678b1;color: #039;font-size: 14px;font-weight: normal;padding: 10px 8px;"><?php echo $this->translate->t("Запитване") ?></th>
            </tr>
            <tr> 
                <td colspan="3" style="color: #669;padding: 9px 8px 0;"><?php echo $this->input->post("query"); ?></td>
            </tr>
        </table>
    </body>
</html>
