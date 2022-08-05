package vexriscv.periph.chacha

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.eda.altera.QSysify
import spinal.lib.slave

object Apb3ChachaCtrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3ChachaCtrl(apb3Config : Apb3Config) extends Component {
  val io = new Bundle {
      val apb = slave(Apb3(Apb3ChachaCtrl.getApb3Config))
  }

  val chacha_module = new chacha
  val apbCtrl = Apb3SlaveFactory(io.apb)

  apbCtrl.driveAndRead(chacha_module.io.cs, address=0)
  apbCtrl.driveAndRead(chacha_module.io.we, address=4)
  apbCtrl.driveAndRead(chacha_module.io.addr, address=8)
  apbCtrl.driveAndRead(chacha_module.io.write_data, address=12)

  //val resSyncBuf = RegNextWhen(gcdCtrl.io.res, gcdCtrl.io.ready)
  apbCtrl.read(chacha_module.io.read_data, address=16)
}