<template>
  <a-card :bordered="false">
    <a-tabs defaultActiveKey="1">
      <!-- 柱状图 -->
      <a-tab-pane tab="体温个人情况" key="1">
        <bar title="体温个人情况" :dataSource="barData" :height="height"/>
      </a-tab-pane>
    </a-tabs>
  </a-card>
</template>

<script>
  import AreaChartTy from '@/components/chart/AreaChartTy'
  import Bar from '@/components/chart/Bar'
  import BarMultid from '@/components/chart/BarMultid'
  import DashChartDemo from '@/components/chart/DashChartDemo'
  import LineChartMultid from '@/components/chart/LineChartMultid'
  import Liquid from '@/components/chart/Liquid'
  import MiniBar from '@/components/chart/MiniBar'
  import MiniArea from '@/components/chart/MiniArea'
  import MiniProgress from '@/components/chart/MiniProgress'
  import Pie from '@/components/chart/Pie'
  import Radar from '@/components/chart/Radar'
  import RankList from '@/components/chart/RankList'
  import TransferBar from '@/components/chart/TransferBar'
  import Trend from '@/components/chart/Trend'
  import BarAndLine from '@/components/chart/BarAndLine'

  export default {
    name: 'MonitorList',
    components: {
      Bar, MiniBar, BarMultid, AreaChartTy, LineChartMultid,
      Pie, Radar, DashChartDemo, MiniProgress, RankList,
      TransferBar, Trend, Liquid, MiniArea, BarAndLine
    },
    data() {
      return {
        height: 420,
        rankList: [],
        barData: [],
        areaData: []
      }
    },
    created() {
      setTimeout(() => {
        this.loadBarData()
        this.loadAreaData()
        this.loadRankListData()
      }, 100)
    },
    methods: {
      // 产生柱状图数据
      loadData(x, y, max, min, before = '', after = ':00') {
        let data = []
        for (let i = 0; i < 23; i += 1) {
          var xiaoshu = Math.random(Math.random())
          var zhengshu = Math.floor(Math.random()*(max-min+1)+min)
          data.push({
            // x 显示数据
            [x]:  `${i + 1}${after}`,
            //[x]:  `${before}${i + 1}${after}`,
            // y 数据 最低min 最高 max+min
            [y]: Number((Number(xiaoshu) + Number(zhengshu)).toFixed(1))
            // [y]: Math.floor(Math.random() * max) + min
          })
        }
        return data
      },
      // 加载柱状图数据
      loadBarData() {
        this.barData = this.loadData('x', 'y', 40, 36)
      },
      // 加载AreaChartTy的数据
      loadAreaData() {
        this.areaData = this.loadData('x', 'y', 500, 100)
      },
      loadRankListData() {
        this.rankList = this.loadData('name', 'total', 2000, 100, '北京朝阳 ', ' 号店')
      }
    }
  }
</script>

<style scoped>

</style>