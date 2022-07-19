package vexriscv.periph.aes

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.eda.altera.QSysify
import spinal.lib.slave

object Apb3AESCtrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3AESCtrl(apb3Config : Apb3Config) extends Component {
  val io = new Bundle {
      val apb = slave(Apb3(Apb3AESCtrl.getApb3Config))
  }

  val aes_module = new aes
  val apbCtrl = Apb3SlaveFactory(io.apb)

  apbCtrl.driveAndRead(aes_module.io.cs, address=0)
  apbCtrl.driveAndRead(aes_module.io.we, address=4)
  apbCtrl.driveAndRead(aes_module.io.address, address=8)
  apbCtrl.driveAndRead(aes_module.io.write_data, address=12)

  apbCtrl.read(aes_module.io.read_data, address=16)
}