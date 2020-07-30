<template>
  <div :style="{ padding: '0 0 32px 32px' }">
    <h4 :style="{ marginBottom: '20px' }">{{ title }}</h4>
    <v-chart :force-fit="true" :height="height" :data="dataSource" :scale="scale" :padding="padding">
      <v-tooltip/>
      <v-axis/>
      <!-- 恢复柱状图 -->
      <v-bar position="x*y" color="aqua"/>
      
      <!-- 把柱状图变成折线图 
      <v-line position="x*y" color="red" />
      <v-point position="type*y" color="x" :size="4" :v-style="style" :shape="'circle'"/>-->
    </v-chart>
  </div>
</template>

<script>
  import { triggerWindowResizeEvent } from '@/utils/util'

  export default {
    name: 'Bar',
    props: {
      dataSource: {
        type: Array,
        required: false
      },
      yaxisText: {
        type: String,
        default: '摄氏度℃'
      },
      title: {
        type: String,
        default: '标题'
      },
      height: {
        type: Number,
        default: 254
      }
    },
    color : [37.6],
    data() {
      return { padding: ['auto', 'auto', '40', '50'] }
    },
    computed: {
      scale() {
        return [{
          dataKey: 'y',
          alias: this.yaxisText
        }]
      }
    },
    mounted() {
     triggerWindowResizeEvent()
    }
  }
</script>