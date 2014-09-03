<?php
    if($map->get_map()) :
?>

<div class="col-md-8" style="overflow: hidden; height: 350px;">
    <div id="gmap_canvas" style="height: 350px; width: 100%;">&nbsp;</div>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARNOZIOZSBvZTARwM2g84LkPsXpJeErcs" type="text/javascript"></script>
<script type="text/javascript">// <![CDATA[
function init_map()
{
    var myOptions = {
        zoom:17,
        center:new google.maps.LatLng(<?php echo $map->get_map()->lat; ?>,<?php echo $map->get_map()->lng; ?>),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
    var marker = new google.maps.Marker({
                        map: map,
                        position: new google.maps.LatLng(<?php echo $map->get_map()->lat; ?>,<?php echo $map->get_map()->lng; ?>)
                 });
    var infowindow = new google.maps.InfoWindow({
                        content:"<?php echo $map->get_map()->marker; ?>" 
                     });
    google.maps.event.addListener(marker, "click", function(){
        infowindow.open(map,marker);
    });

    infowindow.open(map,marker);
}

google.maps.event.addDomListener(window, 'load', init_map);
// ]]></script>
<?php 
    else :
?>
<div class="col-md-8" style="overflow: hidden; height: 350px;">
    <img src="<?php echo base_url().ZCMS::PUBLIC_PATH?>/images/map.png">
</div>

<?php endif;
